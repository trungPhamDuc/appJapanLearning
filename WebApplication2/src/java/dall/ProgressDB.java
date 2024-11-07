package dall;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Progress;

public class ProgressDB extends DBContext<Progress> {

    public ArrayList<Progress> getProgress(int course_id, int user_id) {
        ArrayList<Progress> progressList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tblProgress WHERE course_id = ? AND user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, user_id);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                Progress progress = new Progress();
                progress.setProgress_id(rs.getInt("progress_id"));
                progress.setUser_id(rs.getInt("user_id"));
                progress.setCourse_id(rs.getInt("course_id"));
                progress.setLesson_id(rs.getInt("lesson_id"));
                progress.setVideo_complete(rs.getBoolean("video_completed"));
                progress.setFlashcard_complete(rs.getBoolean("flashcard_completed"));
                progress.setQuiz_complete(rs.getBoolean("quiz_completed"));
                progressList.add(progress);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProgressDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return progressList;
    }

    @Override
    public ArrayList<Progress> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void insert(Progress entity) {
        try {
            String sql = "INSERT INTO tblProgress (user_id, lesson_id, course_id, video_completed, flashcard_completed, quiz_completed) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getUser_id());
            stm.setInt(2, entity.getLesson_id());
            stm.setInt(3, entity.getCourse_id());
            stm.setBoolean(4, entity.getVideo_complete() != null ? entity.getVideo_complete() : false);
            stm.setBoolean(5, entity.getFlashcard_complete() != null ? entity.getFlashcard_complete() : false);
            stm.setBoolean(6, entity.getQuiz_complete() != null ? entity.getQuiz_complete() : false);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProgressDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Progress entity) {
        StringBuilder sql = new StringBuilder("UPDATE tblProgress SET ");
        boolean hasUpdate = false;

        if (entity.getVideo_complete() != null) {
            sql.append("video_completed = ?, ");
            hasUpdate = true;
        }
        if (entity.getFlashcard_complete() != null) {
            sql.append("flashcard_completed = ?, ");
            hasUpdate = true;
        }
        if (entity.getQuiz_complete() != null) {
            sql.append("quiz_completed = ?, ");
            hasUpdate = true;
        }

        if (hasUpdate) {
            sql.setLength(sql.length() - 2);
            sql.append(" WHERE user_id = ? AND lesson_id = ? AND course_id = ?");

            try {
                PreparedStatement stm = connection.prepareStatement(sql.toString());

                int index = 1;
                if (entity.getVideo_complete() != null) {
                    stm.setBoolean(index++, entity.getVideo_complete());
                }
                if (entity.getFlashcard_complete() != null) {
                    stm.setBoolean(index++, entity.getFlashcard_complete());
                }
                if (entity.getQuiz_complete() != null) {
                    stm.setBoolean(index++, entity.getQuiz_complete());
                }

                stm.setInt(index++, entity.getUser_id());
                stm.setInt(index++, entity.getLesson_id());
                stm.setInt(index, entity.getCourse_id());

                stm.executeUpdate();

            } catch (SQLException ex) {
                Logger.getLogger(ProgressDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Progress entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Progress get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}


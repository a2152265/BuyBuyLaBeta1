package manage;

public class RecordDaoFactory {
	
		private static final RecordDao RECORD_DAO = createRecordDao();
		
		private static RecordDao createRecordDao() {
			RecordDao RecordDao = new RecordDao(null);
			return RecordDao;
		}
		public static RecordDao getRecordDao() {
			return RECORD_DAO;
		}	
		
	}

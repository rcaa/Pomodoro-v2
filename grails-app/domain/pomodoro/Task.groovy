package pomodoro

class Task {

	String summary
	String details
	String status
	Date dateCreated
	Date deadline
	Long timeSpent = 0L
	
	static hasMany = [tags: Tag]
	
    static constraints = {
		summary blank: false, unique: true
		details blank: false
		status blank: false
		deadline nullable: true
		timeSpent min: 0L
    }
}

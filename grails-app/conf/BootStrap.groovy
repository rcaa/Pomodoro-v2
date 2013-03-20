import org.apache.shiro.crypto.hash.Sha256Hash
import pomodoro.User

class BootStrap {

    def init = { servletContext ->
		def user = new User(username: "user123", passwordHash: new Sha256Hash("password").toHex())
		user.addToPermissions("*:*")
		user.save()
    }
	
    def destroy = {
    }
}

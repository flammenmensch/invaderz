package invaders.factory {
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	
	public final class ExplosionFactory {
		
		public static function createExplosion():FlxEmitter {
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 0;
			emitter.lifespan = 10;
			emitter.maxRotation = 0;
			emitter.setXSpeed(-250, 250);
			emitter.setYSpeed(-250, 250);

			var particle:FlxParticle;
			
			for (var i:uint = 0; i < 10; i++) {
				particle = new FlxParticle();
				particle.makeGraphic(2, 2);
				particle.exists = false;
				particle.color = 0x00ffffff;
				particle.lifespan = 5;
				
				emitter.add(particle);
			}
			
			return emitter;
		}
		
	}
}
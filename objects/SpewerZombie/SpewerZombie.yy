{
  "spriteId": {
    "name": "spr_speweridle",
    "path": "sprites/spr_speweridle/spr_speweridle.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": {
    "name": "spr_zombieCollision",
    "path": "sprites/spr_zombieCollision/spr_zombieCollision.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "ZombieParent",
    "path": "objects/ZombieParent/ZombieParent.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"SpewerZombie","path":"objects/SpewerZombie/SpewerZombie.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"Blood","path":"objects/Blood/Blood.yy",},"parent":{"name":"SpewerZombie","path":"objects/SpewerZombie/SpewerZombie.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"SpewerZombie","path":"objects/SpewerZombie/SpewerZombie.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":7,"eventType":7,"collisionObjectId":null,"parent":{"name":"SpewerZombie","path":"objects/SpewerZombie/SpewerZombie.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"SpewerExplosion","path":"objects/SpewerExplosion/SpewerExplosion.yy",},"parent":{"name":"SpewerZombie","path":"objects/SpewerZombie/SpewerZombie.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [],
  "parent": {
    "name": "Zombies",
    "path": "folders/Objects/Zombies.yy",
  },
  "resourceVersion": "1.0",
  "name": "SpewerZombie",
  "tags": [],
  "resourceType": "GMObject",
}
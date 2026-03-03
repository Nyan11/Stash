[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/Nyan11/Stash.svg)](./LICENSE)
[![Unit tests](https://github.com/Nyan11/Stash/actions/workflows/CI.yml/badge.svg)](https://github.com/Nyan11/Stash/actions/workflows/CI.yml)

# Stash

Stash is a serializer for Pharo that convert instances into code.

Stash can be used to genereate readable code that can create clone like instances of the serialized object, allowing developers to manually modify and leverage refactoring tools such as deprecation and class renaming.
To use Stash, you need to define the description of the accessors (setter and getter) of the objects you want to serialize.

# Installation

```st
Metacello new
	baseline: 'StashSerialization';
	repository: 'github://Nyan11/Stash:master';
	load
```

# Usage example

Add the accessors description.
```st
StashTestSetterGetter1 >> #stashAccessors

	<stashAccessors>
	^ { (#name: -> #name) }

```

Instanciate an Object and Serialize it.
```st
"Instanciate a test object with a test class"
object := StashTestSetterGetter1 new name: 'hello'; yourself.

"Serialize the object as a String"
string := Stash new serialize: object.

"
Value of string is:

StashTestSetterGetter1 new
name: 'hello';
yourself
"
```

To desirialize an object, use "Do It" on the generated code in a playground or materialize it:
```st
"Programmaticaly"
object := Stash new materialize: string.
```

# Principles

Stash go through five differents steps:

## 1 - Finding objects references

Using the getters to reference all objects and count the occurences they appears in the graph of element (cyclic references management).

## 2 - Name attribution of referenced objects

During this step Stash will name each objects.
Objects that need to be referenced are given unique name. 
For example if an object appears more than two times, Stash will create a variable in the futur source code to contains it.

## 3 - Writing variables in the source-code

Stash write variables between "pipes" ||.

## 4 - Variable attribution

During this step, Stash affect variables with referenced objects.

## 5 - Writing the source-code

This step generate all the expected source-code.

# License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

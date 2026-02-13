[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/Nyan11/Stash.svg)](./LICENSE)
[![Unit tests](https://github.com/Nyan11/Stash/actions/workflows/CI.yml/badge.svg)](https://github.com/Nyan11/Stash/actions/workflows/CI.yml)

# Stash

Stash is a serializer for Pharo that generate source-code.

Any object is composed of setters and getters, in Stash you define the setters and getters pairs and the serializer use them to access the object and their properties by the getter and use the setter to generate the corresponding serialized object.

Unlike Pharo's native source code generation (storeOn:, etc.), Stash also generate a readable code (as writed by a human) and manage references between objects to prevent cyclics problems. 

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

# Usage example

## Serialization of an object

```st
"Instanciate a test object with a test class"
object := StashTestSetterGetter1 new name: 'hello'; yourself.

"Serialize the object as a String"
string := Stash new serialize: object.
```

string value is:

```
StashTestSetterGetter1 new
name: 'hello';
yourself
```

## Deserialization of an object

Use "Do It" on the generated code in a playground or materialize it:

```st
"Programmaticaly"
object := Stash new materialize: string.
```

## Example with a cycle reference

```st
| stashtestsettergetter11 |
object := StashTestSetterGetter1 new.
object name: object;
yourself.

Stash new serialize: object.
```

# Installation

```st
Metacello new
	baseline: 'StashSerialization';
	repository: 'github://OpenSmock/Stash:master/src';
	load
```

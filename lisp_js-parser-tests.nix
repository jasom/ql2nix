
{ buildLispPackage, stdenv, fetchurl, lisp-project_js-parser, 
   lisp_js-parser,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_js-parser  ];
      inherit stdenv;
      systemName = "js-parser-tests";
      
      sourceProject = "${lisp-project_js-parser}";
      patches = [];
      lisp_dependencies = "${lisp_js-parser}";
      name = "lisp_js-parser-tests-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }

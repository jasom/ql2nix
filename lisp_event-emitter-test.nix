
{ buildLispPackage, stdenv, fetchurl, lisp-project_event-emitter, 
   lisp_event-emitter, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_event-emitter lisp_prove  ];
      inherit stdenv;
      systemName = "event-emitter-test";
      
      sourceProject = "${lisp-project_event-emitter}";
      patches = [];
      lisp_dependencies = "${lisp_event-emitter} ${lisp_prove}";
      name = "lisp_event-emitter-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

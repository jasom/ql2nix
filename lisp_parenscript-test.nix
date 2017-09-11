
{ buildLispPackage, stdenv, fetchurl, lisp-project_parenscript, 
   lisp_cl-js, lisp_eos, lisp_parenscript,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-js lisp_eos lisp_parenscript  ];
      inherit stdenv;
      systemName = "parenscript.test";
      
      sourceProject = "${lisp-project_parenscript}";
      patches = [];
      lisp_dependencies = "${lisp_cl-js} ${lisp_eos} ${lisp_parenscript}";
      name = "lisp_parenscript-test-2.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

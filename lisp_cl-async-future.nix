
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-async-future, 
   lisp_blackbird,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_blackbird  ];
      inherit stdenv;
      systemName = "cl-async-future";
      
      sourceProject = "${lisp-project_cl-async-future}";
      patches = [];
      lisp_dependencies = "${lisp_blackbird}";
      name = "lisp_cl-async-future-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

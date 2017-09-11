
{ buildLispPackage, stdenv, fetchurl, lisp-project_green-threads, 
   lisp_cl-async-future, lisp_cl-cont,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-async-future lisp_cl-cont  ];
      inherit stdenv;
      systemName = "green-threads";
      
      sourceProject = "${lisp-project_green-threads}";
      patches = [];
      lisp_dependencies = "${lisp_cl-async-future} ${lisp_cl-cont}";
      name = "lisp_green-threads-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

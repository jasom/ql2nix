
{ buildLispPackage, stdenv, fetchurl, lisp-project_jsown, 
   lisp_fiveam, lisp_jsown,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_jsown  ];
      inherit stdenv;
      systemName = "jsown-tests";
      
      sourceProject = "${lisp-project_jsown}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_jsown}";
      name = "lisp_jsown-tests-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

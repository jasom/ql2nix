
{ buildLispPackage, stdenv, fetchurl, lisp-project_qmynd, 
   lisp_babel, lisp_flexi-streams, lisp_qmynd,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_flexi-streams lisp_qmynd  ];
      inherit stdenv;
      systemName = "qmynd-test";
      
      sourceProject = "${lisp-project_qmynd}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_flexi-streams} ${lisp_qmynd}";
      name = "lisp_qmynd-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

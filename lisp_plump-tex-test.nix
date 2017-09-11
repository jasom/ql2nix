
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump-tex, 
   lisp_fiveam, lisp_plump-tex,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_plump-tex  ];
      inherit stdenv;
      systemName = "plump-tex-test";
      
      sourceProject = "${lisp-project_plump-tex}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_plump-tex}";
      name = "lisp_plump-tex-test-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

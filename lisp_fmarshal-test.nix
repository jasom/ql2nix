
{ buildLispPackage, stdenv, fetchurl, lisp-project_marshal, 
   lisp_fiveam, lisp_fmarshal,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_fmarshal  ];
      inherit stdenv;
      systemName = "fmarshal-test";
      
      sourceProject = "${lisp-project_marshal}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_fmarshal}";
      name = "lisp_fmarshal-test-20130720-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

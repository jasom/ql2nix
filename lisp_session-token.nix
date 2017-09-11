
{ buildLispPackage, stdenv, fetchurl, lisp-project_session-token, 
   lisp_cl-isaac,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-isaac  ];
      inherit stdenv;
      systemName = "session-token";
      
      sourceProject = "${lisp-project_session-token}";
      patches = [];
      lisp_dependencies = "${lisp_cl-isaac}";
      name = "lisp_session-token-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }


{ buildLispPackage, stdenv, fetchurl, lisp-project_postmodern, 
   lisp_usocket, lisp_md5,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_md5  ];
      inherit stdenv;
      systemName = "cl-postgres";
      
      sourceProject = "${lisp-project_postmodern}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_md5}";
      name = "lisp_cl-postgres-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

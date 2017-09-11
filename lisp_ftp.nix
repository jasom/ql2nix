
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ftp, 
   lisp_cl-ftp,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ftp  ];
      inherit stdenv;
      systemName = "ftp";
      
      sourceProject = "${lisp-project_cl-ftp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ftp}";
      name = "lisp_ftp-20150608-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

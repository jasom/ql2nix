
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ftp, 
   lisp_split-sequence, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-ftp";
      
      sourceProject = "${lisp-project_cl-ftp}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_cl-ftp-20150608-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

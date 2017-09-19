
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ftp, 
   lisp_usocket, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_split-sequence  ];
      inherit stdenv;
      systemName = "ftp";
      
      sourceProject = "${lisp-project_cl-ftp}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_split-sequence}";
      name = "lisp_ftp-20150608-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

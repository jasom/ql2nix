
{ buildLispPackage, stdenv, fetchurl, lisp-project_usocket, 
   lisp_portable-threads, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_portable-threads lisp_split-sequence  ];
      inherit stdenv;
      systemName = "usocket-server";
      
      sourceProject = "${lisp-project_usocket}";
      patches = [];
      lisp_dependencies = "${lisp_portable-threads} ${lisp_split-sequence}";
      name = "lisp_usocket-server-0.7.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

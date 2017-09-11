
{ buildLispPackage, stdenv, fetchurl, lisp-project_usocket, 
   lisp_rt, lisp_usocket-server,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt lisp_usocket-server  ];
      inherit stdenv;
      systemName = "usocket-test";
      
      sourceProject = "${lisp-project_usocket}";
      patches = [];
      lisp_dependencies = "${lisp_rt} ${lisp_usocket-server}";
      name = "lisp_usocket-test-0.7.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

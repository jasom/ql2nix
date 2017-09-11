
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cairo2, 
   lisp_cl-cairo2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cairo2  ];
      inherit stdenv;
      systemName = "a-cl-cairo2-loader";
      
      sourceProject = "${lisp-project_cl-cairo2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cairo2}";
      name = "lisp_a-cl-cairo2-loader-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

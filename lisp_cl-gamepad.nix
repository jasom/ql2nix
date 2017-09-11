
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gamepad, 
   lisp_cffi, lisp_documentation-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "cl-gamepad";
      
      sourceProject = "${lisp-project_cl-gamepad}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_documentation-utils}";
      name = "lisp_cl-gamepad-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

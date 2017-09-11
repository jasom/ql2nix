
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cl-ana-functional-utils, lisp_cl-ana-list-utils, lisp_cl-ana-macro-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ana-functional-utils lisp_cl-ana-list-utils lisp_cl-ana-macro-utils  ];
      inherit stdenv;
      systemName = "cl-ana.binary-tree";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ana-functional-utils} ${lisp_cl-ana-list-utils} ${lisp_cl-ana-macro-utils}";
      name = "lisp_cl-ana-binary-tree-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

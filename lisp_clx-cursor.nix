
{ buildLispPackage, stdenv, fetchurl, lisp-project_clx-cursor, 
   lisp_cl-fad, lisp_clx,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_clx  ];
      inherit stdenv;
      systemName = "clx-cursor";
      
      sourceProject = "${lisp-project_clx-cursor}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_clx}";
      name = "lisp_clx-cursor-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

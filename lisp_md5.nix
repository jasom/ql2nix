
{ buildLispPackage, stdenv, fetchurl, lisp-project_md5, 
   lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "md5";
      
      sourceProject = "${lisp-project_md5}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams}";
      name = "lisp_md5-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

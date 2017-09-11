
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack-component, lisp_lack-util,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack-component lisp_lack-util  ];
      inherit stdenv;
      systemName = "lack";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack-component} ${lisp_lack-util}";
      name = "lisp_lack-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

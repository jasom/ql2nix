
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack-request, lisp_lack-util,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack-request lisp_lack-util  ];
      inherit stdenv;
      systemName = "lack-middleware-csrf";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack-request} ${lisp_lack-util}";
      name = "lisp_lack-middleware-csrf-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }

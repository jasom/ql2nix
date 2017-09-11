
{ buildLispPackage, stdenv, fetchurl, lisp-project_staple, 
   lisp_hunchentoot, lisp_staple,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_staple  ];
      inherit stdenv;
      systemName = "staple-server";
      
      sourceProject = "${lisp-project_staple}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_staple}";
      name = "lisp_staple-server-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }

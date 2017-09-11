
{ buildLispPackage, stdenv, fetchurl, lisp-project_blackbird, 
   lisp_vom,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vom  ];
      inherit stdenv;
      systemName = "blackbird";
      
      sourceProject = "${lisp-project_blackbird}";
      patches = [];
      lisp_dependencies = "${lisp_vom}";
      name = "lisp_blackbird-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

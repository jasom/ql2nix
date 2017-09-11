
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-intbytes, 
   lisp_fast-io,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fast-io  ];
      inherit stdenv;
      systemName = "cl-intbytes";
      
      sourceProject = "${lisp-project_cl-intbytes}";
      patches = [];
      lisp_dependencies = "${lisp_fast-io}";
      name = "lisp_cl-intbytes-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }

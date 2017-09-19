
{ buildLispPackage, stdenv, fetchurl, lisp-project_micmac, 
   lisp_mgl-pax,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mgl-pax  ];
      inherit stdenv;
      systemName = "micmac";
      
      sourceProject = "${lisp-project_micmac}";
      patches = [];
      lisp_dependencies = "${lisp_mgl-pax}";
      name = "lisp_micmac-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }

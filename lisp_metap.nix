
{ buildLispPackage, stdenv, fetchurl, lisp-project_metap, 
   lisp_closer-mop,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "metap";
      
      sourceProject = "${lisp-project_metap}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_metap-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }

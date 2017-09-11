
{ buildLispPackage, stdenv, fetchurl, lisp-project_x-fdatatypes, 
   lisp_iterate, lisp_x-fdatatypes, lisp_x-let-star,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_x-fdatatypes lisp_x-let-star  ];
      inherit stdenv;
      systemName = "x.fdatatypes-iterate";
      
      sourceProject = "${lisp-project_x-fdatatypes}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_x-fdatatypes} ${lisp_x-let-star}";
      name = "lisp_x-fdatatypes-iterate-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }

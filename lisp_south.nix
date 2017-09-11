
{ buildLispPackage, stdenv, fetchurl, lisp-project_south, 
   lisp_drakma, lisp_uuid,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_uuid  ];
      inherit stdenv;
      systemName = "south";
      
      sourceProject = "${lisp-project_south}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_uuid}";
      name = "lisp_south-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

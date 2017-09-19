
{ buildLispPackage, stdenv, fetchurl, lisp-project_south, 
   lisp_uuid, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uuid lisp_drakma  ];
      inherit stdenv;
      systemName = "south";
      
      sourceProject = "${lisp-project_south}";
      patches = [];
      lisp_dependencies = "${lisp_uuid} ${lisp_drakma}";
      name = "lisp_south-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

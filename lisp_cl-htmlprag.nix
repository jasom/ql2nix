
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-htmlprag, 
   lisp_parse-number, lisp_optima,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_optima  ];
      inherit stdenv;
      systemName = "cl-htmlprag";
      
      sourceProject = "${lisp-project_cl-htmlprag}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_optima}";
      name = "lisp_cl-htmlprag-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }

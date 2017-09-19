
{ buildLispPackage, stdenv, fetchurl, lisp-project_zs3, 
   lisp_ironclad, lisp_cxml, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cxml lisp_drakma  ];
      inherit stdenv;
      systemName = "zs3";
      
      sourceProject = "${lisp-project_zs3}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cxml} ${lisp_drakma}";
      name = "lisp_zs3-1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

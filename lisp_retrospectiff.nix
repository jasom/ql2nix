
{ buildLispPackage, stdenv, fetchurl, lisp-project_retrospectiff, 
   lisp_cl-jpeg, lisp_com-gigamonkeys-binary-data, lisp_deflate, lisp_flexi-streams, lisp_ieee-floats, lisp_opticl-core,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-jpeg lisp_com-gigamonkeys-binary-data lisp_deflate lisp_flexi-streams lisp_ieee-floats lisp_opticl-core  ];
      inherit stdenv;
      systemName = "retrospectiff";
      
      sourceProject = "${lisp-project_retrospectiff}";
      patches = [];
      lisp_dependencies = "${lisp_cl-jpeg} ${lisp_com-gigamonkeys-binary-data} ${lisp_deflate} ${lisp_flexi-streams} ${lisp_ieee-floats} ${lisp_opticl-core}";
      name = "lisp_retrospectiff-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

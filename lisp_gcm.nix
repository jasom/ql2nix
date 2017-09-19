
{ buildLispPackage, stdenv, fetchurl, lisp-project_gcm, 
   lisp_com-gigamonkeys-json, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-json lisp_drakma  ];
      inherit stdenv;
      systemName = "gcm";
      
      sourceProject = "${lisp-project_gcm}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-json} ${lisp_drakma}";
      name = "lisp_gcm-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }

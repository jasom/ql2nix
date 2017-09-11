
{ buildLispPackage, stdenv, fetchurl, lisp-project_dweet, 
   lisp_babel, lisp_com-gigamonkeys-json, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_com-gigamonkeys-json lisp_drakma  ];
      inherit stdenv;
      systemName = "dweet";
      
      sourceProject = "${lisp-project_dweet}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_com-gigamonkeys-json} ${lisp_drakma}";
      name = "lisp_dweet-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }

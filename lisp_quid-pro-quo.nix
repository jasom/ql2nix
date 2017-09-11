
{ buildLispPackage, stdenv, fetchurl, lisp-project_quid-pro-quo, 
   lisp_alexandria, lisp_asdf-system-connections, lisp_closer-mop, lisp_method-combination-utilities,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_asdf-system-connections lisp_closer-mop lisp_method-combination-utilities  ];
      inherit stdenv;
      systemName = "quid-pro-quo";
      
      sourceProject = "${lisp-project_quid-pro-quo}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_asdf-system-connections} ${lisp_closer-mop} ${lisp_method-combination-utilities}";
      name = "lisp_quid-pro-quo-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }

{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-singleton-mixin, 
   lisp_closer-mop, lisp_metap,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_metap  ];
      inherit stdenv;
      systemName = "cl-singleton-mixin";
      
      sourceProject = "${lisp-project_cl-singleton-mixin}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_metap}";
      name = "lisp_cl-singleton-mixin-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }

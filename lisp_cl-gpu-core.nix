
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gpu, 
   lisp_trivial-garbage, lisp_sb-vector-io, lisp_hu-dwim-walker, lisp_bordeaux-threads, lisp_cffi, lisp_hu-dwim-asdf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_sb-vector-io lisp_hu-dwim-walker lisp_bordeaux-threads lisp_cffi lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "cl-gpu.core";
      
      sourceProject = "${lisp-project_cl-gpu}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_sb-vector-io} ${lisp_hu-dwim-walker} ${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_hu-dwim-asdf}";
      name = "lisp_cl-gpu-core-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }

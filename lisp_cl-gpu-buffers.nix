
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gpu, 
   lisp_cffi, lisp_hu-dwim-asdf, lisp_hu-dwim-def-contextl, lisp_hu-dwim-util, lisp_trivial-garbage, lisp_sb-vector-io,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_hu-dwim-asdf lisp_hu-dwim-def-contextl lisp_hu-dwim-util lisp_trivial-garbage lisp_sb-vector-io  ];
      inherit stdenv;
      systemName = "cl-gpu.buffers";
      
      sourceProject = "${lisp-project_cl-gpu}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-contextl} ${lisp_hu-dwim-util} ${lisp_trivial-garbage} ${lisp_sb-vector-io}";
      name = "lisp_cl-gpu-buffers-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }

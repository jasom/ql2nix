
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-neovim, 
   lisp_cl-messagepack-rpc, lisp_form-fiddle, lisp_split-sequence, lisp_babel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-messagepack-rpc lisp_form-fiddle lisp_split-sequence lisp_babel  ];
      inherit stdenv;
      systemName = "cl-neovim";
      
      sourceProject = "${lisp-project_cl-neovim}";
      patches = [];
      lisp_dependencies = "${lisp_cl-messagepack-rpc} ${lisp_form-fiddle} ${lisp_split-sequence} ${lisp_babel}";
      name = "lisp_cl-neovim-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }

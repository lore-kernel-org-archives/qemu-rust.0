Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuDTI-0008VP-F3
	for mharc-qemu-rust@gnu.org; Mon, 17 Mar 2025 12:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuDT1-0008Ne-Je
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 12:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuDSx-0000Bn-Cw
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 12:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742229442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYcG2QNzGLgZ5qOapiCQwiKdaL5WSa5O/uWHhdEsv0s=;
 b=dWc0SFGK7ce6gKGgJVAneqfUoPQewcXGTauPBrVD8Q30qC9JiH2MbgW4mL87cejjVuBGcZ
 xcD9J1p/rYoHhJxfMdBhxn8pwK6fSKqIX5F96IXX5tAtkmp6k9k4MyLIzkXMX5UOMbcNWi
 1ZKyUO8ku/sBVcP6jJb35qHOPRipBik=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-OSdw6yE_OliXSHIO6BxL-g-1; Mon, 17 Mar 2025 12:37:20 -0400
X-MC-Unique: OSdw6yE_OliXSHIO6BxL-g-1
X-Mimecast-MFC-AGG-ID: OSdw6yE_OliXSHIO6BxL-g_1742229439
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ab5baf62cso21439375e9.0
 for <qemu-rust@nongnu.org>; Mon, 17 Mar 2025 09:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742229438; x=1742834238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYcG2QNzGLgZ5qOapiCQwiKdaL5WSa5O/uWHhdEsv0s=;
 b=aqvI3qN+SdBXXubUrznV/Nbr0PVD7flF/DuZEh/RKVy/zh60UXlrLzi39OSSJe7deT
 bGS0b9w3UNFg84vB9DJVC2DuOV1Ua2xhsoLf2dq0nqeG+aUTLFLblEhhZepHqZlgf6cF
 0cMR2aCb9g75mnMMFz8yNOItjQ+1CkstG8nBndZSAjAJKiZ1umrlU5Tmk997kQNrd+FW
 MWeffftjNX2Wu3hV9EP+PGOJJsKATmwyEpiMisRSYY4jBDvWWXOo9Auc0l5EJrUm0BCF
 6XYIrZLNfInCrmOy7KOMGPnUBBUlKUQysJYCE9zwSUfwmNhSEPTz39vNhoOrWg/Q7zLe
 RS4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXJJ6sYNToBjOJvny6QNOrl/LexdsiBcGkKHJ+EbpM0+OQW9VLvHCzHLk8q/xm1zll51AOEVu/H84=@nongnu.org
X-Gm-Message-State: AOJu0YyYup7isOmxtbV9bz42s7e/Z80A9gvE9+4Hf8kIDXstndWaDaf1
 8QLWYqKzSTQ1B/HTICZyL2TI4PpewVVr7UGz1B/Mzt6KaHE11L3yKEaaRLnIgS+RqKVaaz9BHKv
 m2XOl26g+S+a3zkitx7ZLTALlvM6R2eb6tIg631YTnpO0a730bnxL0edS0oQBywtvYpAovl8ZZe
 jIYHpt95wgGYDXP6uh2plN8cAwuaBKvB5H5w==
X-Gm-Gg: ASbGncscZSOT5gp1iYjxexCpwQQB3FPb2fC5vdpoO3HsUJ9KcWdeIGzAKut7II+wKll
 Elc8w8tM6XyQ3BfI7yhXXYDQmbkWglvqPBwLtarfAT89Bq4XLuN2EAPQFdLPcQQxAzIGtep6ZaQ
 ==
X-Received: by 2002:a05:600c:3146:b0:43c:ea1a:720c with SMTP id
 5b1f17b1804b1-43d1ecb1019mr126759425e9.18.1742229438335; 
 Mon, 17 Mar 2025 09:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWG4Q/ohnbmNVUxrxjBS/NH5I3UPo8Ioxwqxuzt+uGeKI/yIx6nCjidbR4Gb3D5eqs1tl4oZNQ4MGlTYSt/OY=
X-Received: by 2002:a05:600c:3146:b0:43c:ea1a:720c with SMTP id
 5b1f17b1804b1-43d1ecb1019mr126759235e9.18.1742229437984; Mon, 17 Mar 2025
 09:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250317151236.536673-1-zhao1.liu@intel.com>
 <20250317151236.536673-4-zhao1.liu@intel.com>
In-Reply-To: <20250317151236.536673-4-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Mar 2025 17:37:06 +0100
X-Gm-Features: AQ5f1Jo23zt-CpUQ-vUNM8JLpBuZDcSWBhmWsNpWuWyxlwTgTsz0OWMlqEPAc4U
Message-ID: <CABgObfYrdpkTGFfDKFGK7zkHJVW5Tn2q=tXw6d97m4P_3ZNdrA@mail.gmail.com>
Subject: Re: [PATCH 03/17] rust/vmstate: Add a prefix separator ", " for the
 array field in vmstate macros
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jsq5RDzjMgHoG5WUnQnQxL6_AloyC8rNR9WXm3k80Ao_1742229439
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2025 16:37:39 -0000

On Mon, Mar 17, 2025 at 3:52=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> The fields are separated by ",", so it's necessary to add ", " in array
> field to avoid matching failure.

This is not a field though, the only (intended) fields are name and
field. It's meant to mimic the slice since &a[0..n].

Paolo

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  rust/qemu-api/src/vmstate.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
> index 9533b1250fa5..94efbd8bb735 100644
> --- a/rust/qemu-api/src/vmstate.rs
> +++ b/rust/qemu-api/src/vmstate.rs
> @@ -202,7 +202,7 @@ pub const fn vmstate_varray_flag<T: VMState>(_: Phant=
omData<T>) -> VMStateFlags
>  /// and [`impl_vmstate_forward!`](crate::impl_vmstate_forward) help with=
 this.
>  #[macro_export]
>  macro_rules! vmstate_of {
> -    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:e=
xpr)?])? $(,)?) =3D> {
> +    ($struct_name:ty, $field_name:ident $(, [0 .. $num:ident $(* $factor=
:expr)?])? $(,)?) =3D> {
>          $crate::bindings::VMStateField {
>              name: ::core::concat!(::core::stringify!($field_name), "\0")
>                  .as_bytes()
> @@ -435,7 +435,7 @@ macro_rules! vmstate_unused {
>  #[doc(alias =3D "VMSTATE_STRUCT")]
>  #[macro_export]
>  macro_rules! vmstate_struct {
> -    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:e=
xpr)?])?, $vmsd:expr, $type:ty $(,)?) =3D> {
> +    ($struct_name:ty, $field_name:ident $(, [0 .. $num:ident $(* $factor=
:expr)?])?, $vmsd:expr, $type:ty $(,)?) =3D> {
>          $crate::bindings::VMStateField {
>              name: ::core::concat!(::core::stringify!($field_name), "\0")
>                  .as_bytes()
> --
> 2.34.1
>



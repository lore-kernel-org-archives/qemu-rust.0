Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1362CA0FE7
	for <qemu-rust@archiver.kernel.org>; Tue, 26 Aug 2025 18:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uqyPk-00080o-Iq; Tue, 26 Aug 2025 14:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqyPb-0007zL-Ay
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 14:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqyPU-0005lI-HB
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 14:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756232922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LJgZMongY8gc+amL6CLWHDzsA+ET4Nhz6PhvuBmak3c=;
 b=OWP2WRl/u/zEFVYhABYLdFkWVCJyU61BJnlIIGuNTLhN7kIyI7duyRLm1qNS6GDnceM82O
 D+jYDAug235twMqToUtrlqHOFpxAHq7H3cLrhQfINPEvjSoKPsfzuGW6CFFclq+Fih+1Zc
 XRn30LQFYiWo5wNq8Txk7Qb3ZsEPcb0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-Uafz4_U2MkuQF038yQJMbQ-1; Tue, 26 Aug 2025 14:28:40 -0400
X-MC-Unique: Uafz4_U2MkuQF038yQJMbQ-1
X-Mimecast-MFC-AGG-ID: Uafz4_U2MkuQF038yQJMbQ_1756232919
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0cc989so42223395e9.3
 for <qemu-rust@nongnu.org>; Tue, 26 Aug 2025 11:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756232919; x=1756837719;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LJgZMongY8gc+amL6CLWHDzsA+ET4Nhz6PhvuBmak3c=;
 b=X04NRf8cTCkhipA1Vszflynt2dJAAnNDHljwuOBC6IM2tHDedU40mUACKz5w2L7rHX
 s6RQWYmekXxBSTsKj3MT7nHJlHmQiK4mq0KI5uD/3MUUiHm58Q6xQAkp1wOrAKxjJ4pT
 ivgmV9oYXFjLw5nBn78NvVdpAkkacTg81BzAAuCc6ONd4qlHXFsII9MhkrZOx71WVNx4
 nxS3AFl1ePKnjkR/Rnl4EQjeQ5nEL/Ziolonhznj8VNW3AxXNpjuWdsJYQSgDHBTA0VS
 2g7ZldHszxVUkn+dy1wbTemCkoe2VbBf0UoBTDPiDIk8C4X9s1uT3Mze/4CoPGBzres2
 NDuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKGH5KBvmeXGn/q0YkMz2Rh9ep7D2KFqMtBDndDFiU3mvMnQxzoAeEU7VFvvMnV9EpsDaAnrgHkWY=@nongnu.org
X-Gm-Message-State: AOJu0YyQuFpMFzcGTCrnsVqtYdagnSU91Dzv4gHjb/r68aOOICKHZRlD
 ItSORuxmfPgILuW3+V5PIg144htvk9bBHzmVG0S351MqR/x1p6m4XA+UhCoslakInur22KOrwDJ
 qQruSimUncn+1tmL9gNsm5NgnYeCTLDb6x3Tofb4nDKvLF+dNGPKL9No=
X-Gm-Gg: ASbGncvZlXqo3D303HRt8V7kFVlOzhg88+Gy8/rEb3ge9UGxcPIVOAt0HIxBDjSBaCB
 gfhUjy3Is3DRGIQtKmybhCsKDYt9e6O3VWsFsOCWJve5twSd/1NShqHBe2CqYbfKynbsmZMtAzQ
 REv56qK4N3zaw1iMSBYsWhWsUtBk1fwVxCbFmbPWNEYFocvmfoKCQBNcLOLi5fhCjAjIqsn+QkN
 bR+mEPi7CNBEs5/qDeDEpf24AuIaiGL/ppLcuuFAHC0FWAn7BDhAw6CcSTvbxkHKFeRr5ZwjXcL
 xAVhXVyvvPXPbF0MpHdsm8G1GlZnmGS3f7vS7Ud6McFb93Swptznxb7RGA8PNhOm3HzcawCevlT
 o4+hQwVdot3PMQQ8F9lKzCBJoSbtWlsvhaQtq8rcK5sqp
X-Received: by 2002:a05:600c:458a:b0:459:da76:d7aa with SMTP id
 5b1f17b1804b1-45b517dc897mr161002885e9.25.1756232918872; 
 Tue, 26 Aug 2025 11:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBni2R/b8POqKwffOq3vvuNrd+Nr/+m7gzXFbGD3Ip+BYq2so1IJ6ZqVHF1B2QI7R4ZjMHgQ==
X-Received: by 2002:a05:600c:458a:b0:459:da76:d7aa with SMTP id
 5b1f17b1804b1-45b517dc897mr161002685e9.25.1756232918480; 
 Tue, 26 Aug 2025 11:28:38 -0700 (PDT)
Received: from [192.168.178.61] ([151.38.246.11])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-45b6c5b2eb8sm2839485e9.4.2025.08.26.11.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 11:28:37 -0700 (PDT)
Message-ID: <456e56b3-00d5-48af-b757-79037ab8185a@redhat.com>
Date: Tue, 26 Aug 2025 20:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/18] rust: move Cell vmstate impl
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-rust@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250826140449.4190022-1-marcandre.lureau@redhat.com>
 <20250826140449.4190022-8-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250826140449.4190022-8-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 611RYy_9goX8DkXMyjK8B_DLEAWaidYjGRhtf1dVyDw_1756232919
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 8/26/25 16:04, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This will allow to split vmstate to a standalone crate next.

Can you explain why this is needed?  Could "migration" depend on "bql" 
(or even, "bql" could stay in util), and keep the implementation of 
VMState for cells, just like you do for Opaque?

Thanks,

Paolo

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   rust/qemu-api/src/cell.rs    |  5 ++++-
>   rust/qemu-api/src/vmstate.rs | 16 +++++++---------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
> index 98d720caf9..4bce526e45 100644
> --- a/rust/qemu-api/src/cell.rs
> +++ b/rust/qemu-api/src/cell.rs
> @@ -152,7 +152,7 @@
>       ptr::NonNull,
>   };
>   
> -use crate::bindings;
> +use crate::{bindings, impl_vmstate_transparent};
>   
>   /// An internal function that is used by doctests.
>   pub fn bql_start_test() {
> @@ -866,3 +866,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>           (**self).fmt(f)
>       }
>   }
> +
> +impl_vmstate_transparent!(BqlCell<T> where T: VMState);
> +impl_vmstate_transparent!(BqlRefCell<T> where T: VMState);
> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
> index c1e2b06390..9d33997c57 100644
> --- a/rust/qemu-api/src/vmstate.rs
> +++ b/rust/qemu-api/src/vmstate.rs
> @@ -29,8 +29,7 @@
>   
>   use common::{callbacks::FnCall, Zeroable};
>   
> -use crate::bindings::VMStateFlags;
> -pub use crate::bindings::{VMStateDescription, VMStateField};
> +pub use crate::bindings::{VMStateDescription, VMStateField, VMStateFlags};
>   
>   /// This macro is used to call a function with a generic argument bound
>   /// to the type of a field.  The function must take a
> @@ -325,15 +324,16 @@ unsafe impl $crate::vmstate::VMState for $tuple {
>   
>   // Transparent wrappers: just use the internal type
>   
> +#[macro_export]
>   macro_rules! impl_vmstate_transparent {
>       ($type:ty where $base:tt: VMState $($where:tt)*) => {
> -        unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
> -            const SCALAR_TYPE: VMStateFieldType = <$base as VMState>::SCALAR_TYPE;
> -            const BASE: VMStateField = VMStateField {
> +        unsafe impl<$base> $crate::vmstate::VMState for $type where $base: $crate::vmstate::VMState $($where)* {
> +            const SCALAR_TYPE: $crate::vmstate::VMStateFieldType = <$base as $crate::vmstate::VMState>::SCALAR_TYPE;
> +            const BASE: $crate::vmstate::VMStateField = $crate::vmstate::VMStateField {
>                   size: mem::size_of::<$type>(),
> -                ..<$base as VMState>::BASE
> +                ..<$base as $crate::vmstate::VMState>::BASE
>               };
> -            const VARRAY_FLAG: VMStateFlags = <$base as VMState>::VARRAY_FLAG;
> +            const VARRAY_FLAG: $crate::vmstate::VMStateFlags = <$base as $crate::vmstate::VMState>::VARRAY_FLAG;
>           }
>       };
>   }
> @@ -341,8 +341,6 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
>   impl_vmstate_transparent!(std::cell::Cell<T> where T: VMState);
>   impl_vmstate_transparent!(std::cell::UnsafeCell<T> where T: VMState);
>   impl_vmstate_transparent!(std::pin::Pin<T> where T: VMState);
> -impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
> -impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
>   impl_vmstate_transparent!(::common::Opaque<T> where T: VMState);
>   
>   #[macro_export]



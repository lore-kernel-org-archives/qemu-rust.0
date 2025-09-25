Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4969CAC5B1
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 16:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1pH5-0006Vn-2S; Thu, 25 Sep 2025 12:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1pH3-0006Vb-Kh
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 12:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1pGz-0000PF-L5
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 12:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758819401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l9xOjTUmjL6f40nOvXHEu6IEzN2COneWIC+IgsaSJvs=;
 b=gaMYM/427OvnipkeVMzWCcIh/2EBC/5i23wbF4BzJHgvXaBgw0F1Y6U+jTYE29/QL45dq5
 O/+QauY2cKrhx1nrk/TGG7xSSZR3vsyswh8tCKmnFC4XkVDN3nWVYj59CEARvdDAejA3Ag
 HJ9xx96zKSXZqIj9ouMYk0CDAZ9cF5U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-lWTYF_f2MO2ru_PovL_qSg-1; Thu, 25 Sep 2025 12:56:39 -0400
X-MC-Unique: lWTYF_f2MO2ru_PovL_qSg-1
X-Mimecast-MFC-AGG-ID: lWTYF_f2MO2ru_PovL_qSg_1758819398
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-6340b40a3a2so936397a12.1
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 09:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758819398; x=1759424198;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9xOjTUmjL6f40nOvXHEu6IEzN2COneWIC+IgsaSJvs=;
 b=By+9YMLxMMXJqMBK6d4wgj8Ftpvdf0mLwPyMZ2koaeBGiVffz7EoxZkeOOXV56jeKA
 fUYcxcJH4i5c0+tCCrjhpi8jyoFV5WnZYibEf0nl5+OOMePFsx0/O/1T3KLqTLXti/ah
 LaCT1VCf+1jG1DJs11VjCX2v6s9O7W5oYVaOovSZWrdL/nxm+QZKEqTYv5hTZ474TPjl
 Pg/iFsIOMNi2ed5Vg9KSVOc+OjJHBX7IDTqldvffjDhboOI22f/jbmSl5INwanQJMdny
 zxGWcR9zUnI1OyRj7OTqcOb/3E2qVzHblLyGvRUeYGHzrDS4GHvzzxxupt4FbzhKSh3F
 XoAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUteVBNI76aHKT3neQulRDELe6M8a4tAbVmQaqxIOHLjzKlswZGX+65PcAONE9wAZB24PMyK9b09SI=@nongnu.org
X-Gm-Message-State: AOJu0YzONQ8H9ORi2iFAKh3FCoaA4vLw3J8n3KUrfQz0zn6a8gpO9iYZ
 1uEqIBlRUMvWeYgOUdA4WYKsoakqTGBbiJNs8CeNwoLq0aD/gvMK3qolhc8LqDXXh7/0x19pUhe
 Qvg6/uQEgtthT/seOFo0YzZgTaUTzN8YgxJaNpzwP6TqOv4qbgY0Fkx8=
X-Gm-Gg: ASbGncsF1o+4ST/4tLxusOdCZ23geR0zMR7KPtsstF81rHyM+DiED45/do6eIdAxcok
 eIsgtYCHkKUuDxeCsY+C4LsdWRYZYadg+9G/XbWX2UGc+aPtH7bwBNGCvHDCgSBmO7hZlE67tcD
 /KxHz0tL0AwZl2p7dlHJP7JJZ43bAkDvFIckNbyXyTHO6nZMH/gYsHqXmzgyLwxxRDYttX7VApk
 XfwucbJThV0+Q9M2C71elHJJxpq/ThfOMDq/gHg8k+talpsWf2eGyS5qFtLENMUwxOev5PwRXEK
 9KnK9ynT7xDWz6q1RMSO1mb514QhGB4frBzo6ohvFPzZMwt/yr1Driwbkkk45m7hYPo7brODElA
 duS+uCB63Wzr6zPu/3Ks1CUKHMSgIAsveEBTNEPcdYg==
X-Received: by 2002:a05:6402:42ca:b0:634:b3d1:8f92 with SMTP id
 4fb4d7f45d1cf-634b3d19125mr763185a12.0.1758819398062; 
 Thu, 25 Sep 2025 09:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG05CN6qEaAjff9j+oDZxPJVNbtbBsmQrOMPdzbFMLFJBhAal3q4w4i/Vmu9C7HeEPCBeWLQg==
X-Received: by 2002:a05:6402:42ca:b0:634:b3d1:8f92 with SMTP id
 4fb4d7f45d1cf-634b3d19125mr763146a12.0.1758819397504; 
 Thu, 25 Sep 2025 09:56:37 -0700 (PDT)
Received: from [192.168.1.84] ([93.56.170.206])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-634a364fd05sm1469811a12.13.2025.09.25.09.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 09:56:36 -0700 (PDT)
Message-ID: <272e5d71-0671-4ebb-9ce0-7abde2720a44@redhat.com>
Date: Thu, 25 Sep 2025 18:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] rust: qemu-macros: add ToMigrationState derive macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, manos.pitsidianakis@linaro.org
References: <20250920142958.181910-1-pbonzini@redhat.com>
 <20250920142958.181910-6-pbonzini@redhat.com> <aNU3Cgll0vETC2Az@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aNU3Cgll0vETC2Az@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l7oTAYKsVZRcJxXxGYfbIyXtGp8T4E7SXij9u20iQG8_1758819398
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/25/25 14:35, Zhao Liu wrote:
>> +/// #[derive(ToMigrationState)]
>>   /// pub struct DeviceRegs {
>>   ///     status: u32,
>>   /// }
>> +/// # unsafe impl VMState for DeviceRegsMigration {
>> +/// #     const BASE: VMStateField = ::common::Zeroable::ZERO;
>> +/// # }
> 
> Outdated comment? Looks like the DeviceRegsMigration definition is
> missing.

It's defined by the #[derive(ToMigrationState)].

> the below conversion is ugly:>
> #[property(rename = "msi", bit = HPET_FLAG_MSI_SUPPORT_SHIFT as u8, default = false)]
> 
> conversion should happen within the macro parsing process. But unfortunately,
> try_into() is not const, maybe I could do this for bit property:
> 
> diff --git a/rust/qemu-macros/src/lib.rs b/rust/qemu-macros/src/lib.rs
> index c459f9bcb42f..e67df57c3712 100644
> --- a/rust/qemu-macros/src/lib.rs
> +++ b/rust/qemu-macros/src/lib.rs
> @@ -275,7 +275,10 @@ macro_rules! str_to_c_str {
>                   name: ::std::ffi::CStr::as_ptr(#prop_name),
>                   info: #qdev_prop,
>                   offset: ::core::mem::offset_of!(#name, #field_name) as isize,
> -                bitnr: #bitnr,
> +                bitnr: {
> +                    const _: () = assert!(#bitnr <= u8::MAX as _, "bit exceeds u8 range");
> +                    #bitnr as u8
> +                },
>                   set_default: #set_default,
>                   defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: #defval as u64 },
>                   ..::common::Zeroable::ZERO

Good idea (also testing >= 0 is needed).  "const { assert!(...); }" is 
even simpler.

>> +/// - `#[migration_state(clone)]` - Clones the field value.
> 
> How about emphasizing the use case?
> 
> "Clones the field value, especially for the types don't implement `Copy`."

I don't have a use case yet to be honest, but at the same time I want to 
help potential device authors and remove the need to muck with the macro.

>> +/// Fields without any attributes use `ToMigrationState` recursively; note that
>> +/// this is a simple copy for types that implement `Copy`.
>> +///
>> +/// # Attribute compatibility
>> +///
>> +/// - `omit` cannot be used with any other attributes
>> +/// - only one of `into(Type)`, `try_into(Type)` can be used, but they can be
>> +///   coupled with `clone`.
>> +///
> 
> ...
> 
> The implementation of the entire macro is great.

Thanks. :)  It's indeed pretty easy to follow, and I like procedural 
macro code that is simple but powerful.

The attrs crate also helps a lot!

>> +#[test]
>> +fn test_derive_to_migration_state() {
> 
> ...
> 
>> +        quote! {
>> +            #[derive(Default)]
>> +            pub struct CustomMigration {
>> +                pub shared_data: String,
>> +                pub converted_field: Cow<'static, str>,
>> +                pub fallible_field: i8,
>> +                pub nested_field: <NestedStruct as ToMigrationState>::Migrated,
>> +                pub simple_field: <u32 as ToMigrationState>::Migrated,
>> +            }
> 
> In the production code, CustomMigration still needs to implement VMState
> trait, so that String & Cow<'static, str> also need to implement VMState
> trait. This seems like the thing that we are currently missing.

Or more simply they're not chosen well. :)  For the documentation I will 
think of better types.

> For test, it's enough to show how the macro works.

Yes, for testing it's a lesser deal.

Paolo



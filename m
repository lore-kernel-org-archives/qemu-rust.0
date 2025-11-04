Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E6CCF9E3
	for <qemu-rust@archiver.kernel.org>; Tue,  4 Nov 2025 14:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vGIDT-0001W4-Rt; Tue, 04 Nov 2025 09:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vGIDS-0001Vm-7O
 for qemu-rust@nongnu.org; Tue, 04 Nov 2025 09:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vGIDP-0000Ik-Rh
 for qemu-rust@nongnu.org; Tue, 04 Nov 2025 09:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762267252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TLuEQK6nczcQpH6Y03wNMm12WVfEPzppTG57S8h6lTk=;
 b=Lr6joPmpX3XfNRmEo3xNGMItkAtpKu9RgOEqVv0oOl9+aH7hen0SLJwDCL6gy9y/3dR/17
 9WjQLUh/PnJ2rUlKcWkc7HjbpXpIL8j6x9ulbybnKNbgaf5QIcf/+2gUH+UiwNsCSyK9qf
 AeM3I0jz72OEKXzVS/KMQ4TMNJWPFqs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-56IS2vKKOnqx-J24ZfT9og-1; Tue, 04 Nov 2025 09:40:51 -0500
X-MC-Unique: 56IS2vKKOnqx-J24ZfT9og-1
X-Mimecast-MFC-AGG-ID: 56IS2vKKOnqx-J24ZfT9og_1762267250
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-64081e1f6a0so4582270a12.1
 for <qemu-rust@nongnu.org>; Tue, 04 Nov 2025 06:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762267250; x=1762872050;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLuEQK6nczcQpH6Y03wNMm12WVfEPzppTG57S8h6lTk=;
 b=NUPkFolxXigeRnmvKCB0w3KYJGjlMY0sEocfTJErb85Ud+7LNPerKTNrU42o36dLBi
 eeC5KWs4nyUYcn3v9YfAHFD7i3KCkd/ikw+3HVK7YYKiVSqgbdkcfNcvgZm93NqjhhRb
 Y9pMLSlOvgTGvG+UNjXL6hyNp3dR7bXt3F41lfyv5g277Tmrpdj9nt/p46pFFZHWsqgL
 MvBcCdPi0noHo9ORlJ4lPcNfSJL91BGT9PHx9yRcHTmTpEmW8f/qN3UIUWfYJ8Pb3mcA
 iKgy3QiWiJ5qC0rkHaWOjwR4p6Yy86RRdoxRNyyhlSxiljQSXWs1UrHiOdCyaSgcb/5j
 Z7ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHAe7ER5wrmiRwwMBOBAgC8j88ZgzV1dbHNqCN5pzGYPW8YCjo+V1NBdZSL5XT550v7oVmoV/pCvw=@nongnu.org
X-Gm-Message-State: AOJu0YzXGCSVLe97/25l7Zeexd2ea9S/qAHnDN/ncJHgmoNfVIZU3CIz
 5tHuA69GTnUsGxGeVwd+T4FSuk3TVxDPN6C+VxdvtVT8kCYDyzfmuHqd5TzkLGvDk2AlDXUWAhu
 eGPhxwVutPRzQIwteN1b4JlqQI8BsIIezlT5B8GsOG7Oh6SELgmLnqS0=
X-Gm-Gg: ASbGncsjXr5pma3BaSlYWimAanTMpHfFyTwV1Vo9cmCTNxBOwUcsK4D20CiNpSQEt6i
 iVvbdj/mTfEZSgGKU+Ld07S76SwvMV7AV+PIiZG7ExQ4fGG+thk14r39aF7wNto4w9MlQ8TUwZ4
 uZT3hx5VIKAiKOa2+j3gmp8nmD6oqHcB1C1E8m2zH54RLE7+VVeZK89GZV6ifPwphoLzdEl+bap
 Bo8uItPmriBe0YFoGDgDSwePvxwnaRgcdBv/M0UCFLfhIRQ1CTDCCXYfAAkEB8EHSnU1m/9EL5q
 mi2x8PUa+qU9psLH21zFHNJJAxfrKKD9YeMcXqDUJoRXdaox+lrLD68ruul6aNCd8nz0u8doWI9
 uR04HOYns9wxTjWo6cJc+wUA7bgf1c1zwsl8D8tL2XWSFiI0FfcCuLnSwz8F1N/TXMkvdShxk4d
 cPWGx0
X-Received: by 2002:a05:6402:848:b0:640:bd21:242f with SMTP id
 4fb4d7f45d1cf-640bd212911mr6485531a12.1.1762267250090; 
 Tue, 04 Nov 2025 06:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJoSPyhx67aMbFoJ2TALMmS9Ik8uCsIODQAS38Wv3S7fVmS5hcHJCMtQ3nZpF8fto3ntgctQ==
X-Received: by 2002:a05:6402:848:b0:640:bd21:242f with SMTP id
 4fb4d7f45d1cf-640bd212911mr6485497a12.1.1762267249622; 
 Tue, 04 Nov 2025 06:40:49 -0800 (PST)
Received: from [192.168.10.48] ([151.95.110.222])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-640e67eb65bsm2214281a12.4.2025.11.04.06.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:40:48 -0800 (PST)
Message-ID: <21c1ea17-6555-4dbf-b10d-e62eca302acf@redhat.com>
Date: Tue, 4 Nov 2025 15:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] rust: qemu-macros: add ToMigrationState derive macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20251001075005.1041833-1-pbonzini@redhat.com>
 <20251001075210.1042479-8-pbonzini@redhat.com> <aQiDFo0Yv6sIZsH5@intel.com>
 <aQjPApAmM2Hma3Rm@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aQjPApAmM2Hma3Rm@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sF1wBg6mZWgvp8xvdR6EL-1q209CbZoeHWwtPKKzUDs_1762267250
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 11/3/25 16:49, Zhao Liu wrote:
>> did you miss something like the following?
>>
>>
>> diff --git a/rust/qemu-macros/src/migration_state.rs b/rust/qemu-macros/src/migration_state.rs
>> index 5edf0efe687f..2064bb73a6f0 100644
>> --- a/rust/qemu-macros/src/migration_state.rs
>> +++ b/rust/qemu-macros/src/migration_state.rs
>> @@ -236,6 +236,16 @@ pub struct #name {
>>           }
>>       }
>>
>> +    fn generate_vmstate_impl(&self) -> TokenStream {
>> +        let name = self.migration_state_name();
>> +
>> +        quote! {
>> +            unsafe impl ::migration::VMState for #name {
>> +                const BASE: ::migration::VMStateField = ::common::Zeroable::ZERO;
> 
> It seems the generated migration_state_struct needs a complete VMSD:
> collect all its fields and build a VMSD.
> 
> And then apply impl_vmstate_struct! to this  migration_state_struct.
> 
> If we zero the BASE, then `vmstate_of!(Self, migration_state)` seems
> can't migrate its fields.

The VMStateDescription for the inner struct is indeed missing, but you 
need to write it yourself and apply impl_vmstate_struct, because the 
derive macro cannot know the checks or version_ids for each field, or 
the subsections.

The VMStateDescription for Migratable<> however is automatic (of 
course), and the outer VMStateDescription for the device is simple---it 
consists only of the parent class if applicable, and the Migratable<>, 
similar to VMSTATE_PL011.

For HPET, you'll have to move the subsections from VMSTATE_HPET to the 
inner VMState.

Paolo



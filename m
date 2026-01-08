Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9CCF6A88
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 09:09:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdm1I-0005U2-D6; Thu, 08 Jan 2026 04:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdm1H-0005T9-15
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 04:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdm1F-00024M-LL
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 04:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767863364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eCFff5jpDe3EVXz+NUzoy2gDQaJ1pHSS1taRjjW9K+Q=;
 b=d80iGbLNOIo1onAK6G+/qXiRK0OZr9CgL9Fu3+ertHq3YSZBYjutaMeuxeB+BlFlQ0H7c0
 O7pXxTyJmC+W3cfZygFyB88QVyH4zuEqnlpRoqElZYxL4SfkImOj0CTyObn9dz5VMX8P2c
 6+aT0rrKl1n9zq3iglYtc9QddZatnqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-qcSpbs2YOruhFFI5ddZoNQ-1; Thu, 08 Jan 2026 04:09:23 -0500
X-MC-Unique: qcSpbs2YOruhFFI5ddZoNQ-1
X-Mimecast-MFC-AGG-ID: qcSpbs2YOruhFFI5ddZoNQ_1767863362
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso33347245e9.2
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 01:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767863362; x=1768468162;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCFff5jpDe3EVXz+NUzoy2gDQaJ1pHSS1taRjjW9K+Q=;
 b=j9Vq47rOy7gpXQDrBwcW5THW8GwVS5LbP6qM7OOKWH7D9SsfB2ShmHT6hEsX7/OCFG
 PM/ySNWl+kXqWYmGJmQ4AUp3PFN635R/QfkMFMZO5mBDxMtdrbhFQRRKKR60DkETW8FB
 nlJ2qXWcul/kEGRAelF1on7ylTOy3RSTIQzmll/9rPrh/M4V63zDguBj02dUy+w80W2K
 XEb+WwNP+7vDlQOIfCCJy7INOKlo053wrDfUAgoOfhBL1wESI+HmCObHt1ztyM+G/CSp
 BdQhKOgUUHb+cWRiWkXEzpUts2Ttboc7eZSjvf1ioUQqrgH2vovc379RauSJAqGRaxEi
 fMQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUO7lecEHdjhnoI50hs73Hoqhm2NG/AbGCuO/muls94pjZL6gVnuVbV5t8ccb7QAvus8vOurdWNA0=@nongnu.org
X-Gm-Message-State: AOJu0YwP4JgBkR2gjuNSEg8f7Zrf8hhWumJvrhljNtyLv8EPZ/w/c5ua
 IiVszfuOMf4W9HH7e/4aIFV+c+9tycZnSK/Zfl1Ttltcz0irpuUqNjZU8VXCLVR+wsviUT/FAk1
 gv9Cdf9UfXFbCXBa0VO7/VSAA8siT9GyThn43wXujJNJSwbzDg2T3xFdBMzKiCtM=
X-Gm-Gg: AY/fxX4ql6g62yP2rQGMIrm9jYGr0Ic3nBKe13KP7OKpAz5ar4ltIjJIMQDqUkLizBF
 G5po0BKhC6XOffghsS4qTNpsI3uuacjP5bbYsYJ4Yt+md768oKk1rpWibJUxiFu+UWn2rM4F0D5
 zxfpP8WSGkGHKOO2Mr2vHtl3u1Y/87eoLdYoYzezpBIzXtVUKJvdgRVBAOZC6mfVCyLrRNI6Wjc
 qoUMa66TmNP9c3gLEXvJCyHEQIeTZdryWQ9XbE49w3D4+uZrokrJqDB4V5+WafofDyGnwPbPNzA
 1KW2b/ohVBf2UXlK7a3UG/MHMik2mJw65Dkk5WffouaAl/FIfilPWMWIkVQLfL6gjWAu14tuAFb
 JoWRSVfaqm8e8PG1UJTBCd5EDYbK7NWL174QL9s53pAB+oe3ADjD5tu49fWpBNMcJlchRgUP53F
 P9xglmSgxIq9IlkA==
X-Received: by 2002:a05:600c:3556:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-47d84b3bb18mr65516755e9.22.1767863360326; 
 Thu, 08 Jan 2026 01:09:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHehBu8XqCb/Ny5Kt/+BvPF4M/btl/XP+tHbp9h25ddq8mDWtjFplE7n/LcRUuJ65oNbNU9jQ==
X-Received: by 2002:a05:600c:3556:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-47d84b3bb18mr65516585e9.22.1767863359932; 
 Thu, 08 Jan 2026 01:09:19 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f4ddsm147162965e9.2.2026.01.08.01.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:09:19 -0800 (PST)
Message-ID: <9041d316-e7ee-4e60-82e2-590dc8797de4@redhat.com>
Date: Thu, 8 Jan 2026 10:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] scripts/qapi: generate high-level Rust bindings
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <20251010151006.791038-15-pbonzini@redhat.com> <87wm2lkze4.fsf@pond.sub.org>
 <b91482ce-69fb-41a4-8e74-2ffd0e6aae6e@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <b91482ce-69fb-41a4-8e74-2ffd0e6aae6e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: phI1P-7W6Z_S9PxK9usHKbbzt-NfeNJzXuVJUK32Rwg_1767863362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/7/26 10:06, Paolo Bonzini wrote:
>> The argument name @c_type suggests it is a C type, but this map contains
>> a mix of C types, QAPI built-in types, and even a user-defined QAPI type
>> (String).  How come?
>>
>> Why do we even have to map from C type to Rust type?  Why can't we map
>> from QAPI type to Rust type, like we map from QAPI type to C type?
> 
> I'll look into it.

Ok, the reason for this is to have a single "def rs_type()" function 
instead of multiple methods ("def rs_type(self)" and "def 
rs_boxed_type(self)" on each of the schema types).

I'll change this to use methods.

Paolo



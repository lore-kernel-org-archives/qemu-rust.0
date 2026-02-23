Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3A4EC1102
	for <qemu-rust@archiver.kernel.org>; Mon, 23 Feb 2026 16:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vuYXe-000206-6I; Mon, 23 Feb 2026 11:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuYXb-0001z7-7Y
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 11:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuYXZ-0005Xf-0s
 for qemu-rust@nongnu.org; Mon, 23 Feb 2026 11:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771863125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ze/An/SOFIjsOjs+x6ZwwPrH9WzszpFw6b9TfdTWBjw=;
 b=V6l80I4rjT6kzuLhGIm6dEZ8dZKFflSdVXKKMdupSk2C7iued9+noTAcyMNauJYjwQaXFU
 CV0+LymHYNG2ZveFSFChJCW6Vl/C5gzB25EXOE2d0r+9gXrR/re+dN6eRvDLbYI9lGh+zP
 fvb1DUyejViqnDeXofO9vtsZIWUXUmI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-hKp-n5ccPp6c3B_YR-M4yw-1; Mon, 23 Feb 2026 11:12:04 -0500
X-MC-Unique: hKp-n5ccPp6c3B_YR-M4yw-1
X-Mimecast-MFC-AGG-ID: hKp-n5ccPp6c3B_YR-M4yw_1771863123
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b8842248611so661575966b.0
 for <qemu-rust@nongnu.org>; Mon, 23 Feb 2026 08:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771863123; x=1772467923;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ze/An/SOFIjsOjs+x6ZwwPrH9WzszpFw6b9TfdTWBjw=;
 b=IfrLCxhISiKFnlZzwmZHGOR2NXHTSKLhxgCStc8wqMBCs9SAe1yZkHfjWfmdX57jfJ
 M/2bUDgv/u8aghSAzW6iSy4fjR2A9X910Kz8XgI2RVn3EKANKJDKOA2/onE30SwAujYX
 aLRkvd94skRTSl2g96FcWs/pMAU9QaUdJZRSKLKHrdUETbbz4SebZlsvkcVFi7ae5y1I
 GRJ8tvhGFDQiGBLec7W/zgwiyr9j9qmI5jcJK6n28VJMWV80rTOVUTmqGSQYBE9gFPIV
 ThMq5DLnY/VFgPGTBUtYFhSAtBzUAnIkKxy8xIP3zHATKnUW5+u4Nk2r0qyWhONA9v18
 D7bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6/QyuK9ZTTF1hltORrE1qedkJq0gcF+UzhbnvM0K1jfA0r8LnV+F1xfNZREnFfL/jThzxmjvDvto=@nongnu.org
X-Gm-Message-State: AOJu0YwrJQP40b1gVIRlIKwx3ASlKiZQFyS2f54ZLqCJDUHLQ3rbu8hB
 MPGSXobyIHIcIVfdlnshqiZd4/juzk30zq2oSymzJHN0rwnDfYkDThbZfJlQLUhdq+UsEyGCsx1
 TwDPCA6tMPEusf2BeMu5vzVd737RbEq6dNeHRAZ1ZLw5BXfORh4pT8EY=
X-Gm-Gg: AZuq6aIhYk5puDvW6ZuaPxW9/j7QnhGpYBrzzMXWKEc7NlOVKA9EoqgfqlKggXoZ9AR
 1q3bB86iz0Jown1xJk2o8xefqz9zA9Od1DP2QM9ssn/h8jG/JCBSz4fdFbyUzEiVRL2pu+wpCrc
 qcNyfHqkUjlrri8HDclZEs33/G4qLjRXtXdmY1hhltC9YBGsYGS7vhaS9Zt57gxLZ93t+iZB8qQ
 CoBbdJKTML9eXUa7obZ0L53M/UwUQaC5BLg101JIbt4zzLJ6gqtjDyvl56PpAIC1kHPtnszXPYj
 Fwt5wsw5w+SRiFIc0TgVU0wZpWmtp0DZGizq1/qyoiRRrUXkL0aylMa7T2ceJyFcgVOC83059Gg
 FUkMPZpl1tWNvec6yuD9krTa3jMqrqDo5QspBB8A+2MglZYM47tK4aI2MM65j7wwkCPdZa1jQhs
 j+EEyof8nfUzZtKqbv8n2tMW8WTGQ=
X-Received: by 2002:a17:906:fe4d:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b9081a4b105mr542935966b.24.1771863122846; 
 Mon, 23 Feb 2026 08:12:02 -0800 (PST)
X-Received: by 2002:a17:906:fe4d:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b9081a4b105mr542933566b.24.1771863122350; 
 Mon, 23 Feb 2026 08:12:02 -0800 (PST)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9084eb912dsm345905066b.55.2026.02.23.08.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:12:01 -0800 (PST)
Message-ID: <80366391-ad17-4ed8-82d4-79a6168e374e@redhat.com>
Date: Mon, 23 Feb 2026 17:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] scripts/qapi: generate high-level Rust bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-13-pbonzini@redhat.com> <87ms0z7i33.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ms0z7i33.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWFA2fMtbJfbnwfmmUWG56g9Dy99Yp_ja7p5eB-ToWo_1771863123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/23/26 13:36, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Generate high-level native Rust declarations for the QAPI types.
>>
>> - char* is mapped to String, scalars to there corresponding Rust types
>>
>> - enums use #[repr(u32)] and can be transmuted to their C counterparts
>>
>> - has_foo/foo members are mapped to Option<T>
>>
>> - lists are represented as Vec<T>
>>
>> - structures map fields 1:1 to Rust
>>
>> - alternate are represented as Rust enum, each variant being a 1-element
>>    tuple
>>
>> - unions are represented in a similar way as in C: a struct S with a "u"
>>    member (since S may have extra 'base' fields). The discriminant
>>    isn't a member of S, since Rust enum already include it, but it can be
>>    recovered with "mystruct.u.into()"
>>
>> Anything that includes a recursive struct puts it in a Box.  Lists are
>> not considered recursive, because Vec breaks the recursion (it's possible
>> to construct an object containing an empty Vec of its own type).
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Link: https://lore.kernel.org/r/20210907121943.3498701-21-marcandre.lureau@redhat.com
>> [Paolo: rewrite conversion of schema types to Rust types]
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Please mention how to actually generate Rust, because it's anything but
> obvious: pass -B qapi.backend.QAPIRsBackend to qapi-gen.py.  Recommend
> to mention it again in the cover letter.
> 
> Additionally, state that this is a hack we'll want to replace both in
> the commit message and a TODO comment.  See review of v1's cover letter
> for why.

Yes, the TODO comment is in patch 14 where the thing actually gets used. 
  I can make it more prominent.

Paolo


